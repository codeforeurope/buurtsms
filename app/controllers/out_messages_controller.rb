class OutMessagesController < ApplicationController
  before_filter :authenticate_user! #, :except => [:getmessage]
  load_and_authorize_resource #:except => [:getmessage]
  # GET /out_messages
  # GET /out_messages.json
  def index
    @out_messages = OutMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @out_messages }
    end
  end

  # GET /out_messages/1
  # GET /out_messages/1.json
  def show
    @out_message = OutMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @out_message }
    end
  end

  # GET /out_messages/new
  # GET /out_messages/new.json
  def new
    @out_message = OutMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @out_message }
    end
  end

  # GET /out_messages/1/edit
  def edit
    @out_message = OutMessage.find(params[:id])
  end

  # POST /out_messages
  # POST /out_messages.json
  def create
    @out_message = OutMessage.new(params[:out_message])

    respond_to do |format|
      if @out_message.save
        format.html { redirect_to @out_message, notice: 'Out message was successfully created.' }
        format.json { render json: @out_message, status: :created, location: @out_message }
      else
        format.html { render action: "new" }
        format.json { render json: @out_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /out_messages/1
  # PUT /out_messages/1.json
  def update
    @out_message = OutMessage.find(params[:id])

    respond_to do |format|
      if @out_message.update_attributes(params[:out_message])
        format.html { redirect_to @out_message, notice: 'Out message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @out_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /out_messages/1
  # DELETE /out_messages/1.json
  def destroy
    @out_message = OutMessage.find(params[:id])
    @out_message.destroy

    respond_to do |format|
      format.html { redirect_to out_messages_url }
      format.json { head :no_content }
    end
  end
end
