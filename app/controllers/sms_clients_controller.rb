class SmsClientsController < ApplicationController
  # GET /sms_clients
  # GET /sms_clients.json
  def index
    @sms_clients = SmsClient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sms_clients }
    end
  end

  # GET /sms_clients/1
  # GET /sms_clients/1.json
  def show
    @sms_client = SmsClient.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sms_client }
    end
  end
  
  def list
    @sms_client = SmsClient.find(params[:id])

    unless session[:sms_client_ids].nil?
      @clients = session[:sms_client_ids].map{|s| SmsClient.find(s)}
      session[:sms_client_ids] = nil
    end
    
    respond_to do |format|
      format.html # list.html.erb
      format.json { render json: @sms_client }
    end
  end

  # GET /sms_clients/new
  # GET /sms_clients/new.json
  def new
    @sms_client = SmsClient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sms_client }
    end
  end

  # GET /sms_clients/1/edit
  def edit
    @sms_client = SmsClient.find(params[:id])
  end

  # POST /sms_clients
  # POST /sms_clients.json
  def create
    @clients = SmsClient.by_district(params[:sms_client][:district]).by_site(params[:sms_client][:site]).by_group(params[:sms_client][:group]).greaterthan_amount(params[:sms_client][:gRepaymentAmount]).lessthan_amount(params[:sms_client][:lRepaymentAmount]).greaterthan_rate(params[:sms_client][:gRepaymentRate]).lessthan_rate(params[:sms_client][:lRepaymentRate])
    session[:sms_client_ids] = @clients.map(&:id)
    respond_to do |format|
      if @clients.present?
        format.html { redirect_to list_sms_client_path(@clients.first), notice: "Copy and paste the phone number(s) below into the text area for 'Recipient(s)' on the  #{view_context.link_to('Send a Message', new_message_path)} page.".html_safe }
        format.json { render json: @clients, status: :created, location: @clients }
      else
        format.html { render action: "new" }
        format.json { render json: @clients.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sms_clients/1
  # PUT /sms_clients/1.json
  def update
    @sms_client = SmsClient.find(params[:id])

    respond_to do |format|
      if @sms_client.update_attributes(params[:sms_client])
        format.html { redirect_to @sms_client, notice: 'Sms client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sms_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_clients/1
  # DELETE /sms_clients/1.json
  def destroy
    @sms_client = SmsClient.find(params[:id])
    @sms_client.destroy

    respond_to do |format|
      format.html { redirect_to sms_clients_url }
      format.json { head :no_content }
    end
  end
end
