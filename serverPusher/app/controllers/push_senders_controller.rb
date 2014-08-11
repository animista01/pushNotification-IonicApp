require 'gcm'
class PushSendersController < ApplicationController
  # GET /push_senders
  # GET /push_senders.json
  def index
    @push_senders = PushSender.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @push_senders }
    end
  end

  # GET /push_senders/1
  # GET /push_senders/1.json
  def show
    @push_sender = PushSender.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @push_sender }
    end
  end

  # GET /push_senders/new
  # GET /push_senders/new.json
  def new
    @push_sender = PushSender.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @push_sender }
    end
  end

  # GET /push_senders/1/edit
  def edit
    @push_sender = PushSender.find(params[:id])
  end

  # POST /push_senders
  # POST /push_senders.json
  def create
    @push_sender = PushSender.new(params[:push_sender])

    respond_to do |format|
      if @push_sender.save
        format.html { redirect_to @push_sender, notice: 'Push sender was successfully created.' }
        format.json { render json: @push_sender, status: :created, location: @push_sender }
      else
        format.html { render action: "new" }
        format.json { render json: @push_sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /push_senders/1
  # PUT /push_senders/1.json
  def update
    @push_sender = PushSender.find(params[:id])

    respond_to do |format|
      if @push_sender.update_attributes(params[:push_sender])
        format.html { redirect_to @push_sender, notice: 'Push sender was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @push_sender.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_senders/1
  # DELETE /push_senders/1.json
  def destroy
    @push_sender = PushSender.find(params[:id])
    @push_sender.destroy

    respond_to do |format|
      format.html { redirect_to push_senders_url }
      format.json { head :no_content }
    end
  end

  def sends
    @pushs = PushSender.all

    respond_to do |format|
      format.html # send.html.erb
      format.json { render json: @pushs }
    end

  end
  def post_sends
    puts "-------------------AQUIIIIIIII--------------------"
    gcm = GCM.new("AIzaSyDgTIj_uwkljhakhRxWDlMF2dAG0aahiRY")
    # you can set option parameters in here
    #  - all options are pass to HTTParty method arguments
    #  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
    #  gcm = GCM.new(api_key, timeout: 3)
    registration_ids = ["APA91bEtqE09wU3awSZWg2-2A5BJqCfKUNLKXObOlEeq4CHlS-Eu_vLzp5GZAuFCWl1kFBfmgfbxSdu2XzsBZIJcYUc9IzDcfMAGyBRDK-0xPL50vz9P1ZEtCLayGqwlBuyOdQpxcz_Sgbi-E9DWfG8QLIR4BB-yOw6HNtI5MYK3CRuMP59jQi0"] # an array of one or more client registration IDs
    options = {
      'data' => {
        'title' => "\ud83d\ude3a Mira esta super Promo",
        'message' => "Esta no es una promocion cualquiera es una super promo!!!",
        'url' => 'http://savvy.land',
        'soundname' => '/android_asset/www/audio/cat.mp3'
      },
        'collapse_key' => 'updated_state'
    }

    response = gcm.send_notification(registration_ids, options)

    respond_to do |format|
      format.html { redirect_to post_sends_path }
    end

  end
end
