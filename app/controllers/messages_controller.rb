require 'uri'
require 'net/http'

class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.sender = "cmu3071" #THIS NEEDS TO BE CHANGED WHEN OAF RECEIVES THEIR OWN SHORTCODE
    @message.time = Time.now
    
    body = @message.body
    phones = Message.split_numbers(@message.recipient)

    phones.each do |ph|
      phone = Message.reformat_phone(ph)
      puts "PHONE: #{phone}"
      url = Message.text_to(phone,body)
      puts "URL: #{url}"
      newUrl = URI.parse(URI.encode(url.strip))
      http = Net::HTTP.new(newUrl.host,443)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      @data = http.get(newUrl.request_uri)
      puts "STATUS: #{@data.code}"
      puts "BODY: #{@data.body}"
      puts "RESPONSE: #{@data}"
    end
       
    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def receive
    @message = Message.new(params[:message])
    @message.sender = params[:number]
    @message.recipient = params[:endpoint]
    @message.body = params[:text]
    @message.time = Time.now
    @message.save
    
    
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
