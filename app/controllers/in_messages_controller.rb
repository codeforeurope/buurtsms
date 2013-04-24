class InMessagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:getmessage]
  load_and_authorize_resource :except => [:getmessage]

  # GET /in_messages
  # GET /in_messages.json
  def index
    @in_messages = InMessage.order('message_timestamp desc').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @in_messages }
    end
  end

  # GET /in_messages/1
  # GET /in_messages/1.json
  def show
    @in_message = InMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @in_message }
    end
  end

  # GET /in_messages/new
  # GET /in_messages/new.json
  def new
    @in_message = InMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @in_message }
    end
  end

  # GET /in_messages/1/edit
  def edit
    @in_message = InMessage.find(params[:id])
  end

  # POST /in_messages
  # POST /in_messages.json
  def create
    @in_message = InMessage.new(params[:in_message])

    respond_to do |format|
      if @in_message.save
        format.html { redirect_to @in_message, notice: 'In message was successfully created.' }
        format.json { render json: @in_message, status: :created, location: @in_message }
      else
        format.html { render action: "new" }
        format.json { render json: @in_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /in_messages/1
  # PUT /in_messages/1.json
  def update
    @in_message = InMessage.find(params[:id])

    respond_to do |format|
      if @in_message.update_attributes(params[:in_message])
        format.html { redirect_to @in_message, notice: 'In message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @in_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /in_messages/1
  # DELETE /in_messages/1.json
  def destroy
    @in_message = InMessage.find(params[:id])
    @in_message.destroy

    respond_to do |format|
      format.html { redirect_to in_messages_url }
      format.json { head :no_content }
    end
  end


  def mark_as_posted
    @in_message = InMessage.find(params[:id])
    @in_message.posted_to_fb = params[:posted]

    respond_to do |format|
      if @in_message.save
        format.html { redirect_to :action => :index, notice: 'Updated' }
        format.json { head :no_content }
      else
        format.html { redirect_to :action => :index, notice: "Unable to save" }
        format.json { render json: @in_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def getmessage #TO BE USED ONLY BY NEXMO API

    # here you can extract more values from parameters as described in nexmo docs.

    text_from_phone_no = params[:msisdn]
    text_body = params[:text]
    text_type = params[:type]
    text_to = params[:to]
    text_network = params[:'network-code']
    text_message_id = params[:messageId]
    text_concat = params[:concat]
    text_concat_ref = params[:'concat-ref']
    text_concat_total = params[:'concat-total']
    text_concat_part = params[:'concat-part']


    #make new message
    @in_message = InMessage.new
    @in_message.msisdn = text_from_phone_no
    @in_message.message_type = text_type
    @in_message.message_text = text_body
    @in_message.to = text_to
    @in_message.network_code = text_network
    @in_message.message_id = text_message_id
    @in_message.concat = text_concat
    @in_message.concat_ref = text_concat_ref
    @in_message.concat_part = text_concat_part
    @in_message.concat_total = text_concat_total
    @in_message.message_timestamp = Time.now
    @in_message.status = "received"
    @in_message.posted_to_fb = false


    #save message do DB
    if @in_message.save
      logger.info("#{Time.now} Message from #{text_from_phone_no} received and saved!")
      #render :nothing => true # this will supply the needed http 200 OK
    else
      logger.error("#{Time.now} Received message could not be saved due to an error!")
      #render :nothing => true # this will supply the needed http 200 OK
    end


    #write a polite reply
    nexmo = Nexmo::Client.new(ENV["NEXMO_KEY"], ENV["NEXMO_SECRET"])


    if !text_from_phone_no.nil? and !text_body.nil?

      #if  text_from_phone_no[0..1] == '31'
      #  #  it's dutch!
      #  new_text_from_phone_no = text_from_phone_no[0..1] + '0' + text_from_phone_no[2..text_from_phone_no.length]
      #  text_from_phone_no = new_text_from_phone_no
      #end

      text_from_phone_no = '+' + text_from_phone_no
      response = nexmo.send_message({
                                        :from => ENV["NEXMO_FROM"],
                                        :to => text_from_phone_no,
                                        :text => t('in_messages.default_reply')
                                    })

      logger.info("#{Time.now} Sending text to #{text_from_phone_no} content: #{t('default_reply')}")


      if response.ok?
        logger.info("#{Time.now} Replied OK to #{text_from_phone_no} messageId #{text_message_id}")
        @in_message.status = "replied"
        @in_message.save
        render :nothing => true # this will supply the needed http 200 OK
      elsif response.failure?
        raise response.error
      end

    else
      logger.info("#{Time.now} Nothing to send!")
      render :nothing => true # this will supply the needed http 200 OK

    end

  end

end
