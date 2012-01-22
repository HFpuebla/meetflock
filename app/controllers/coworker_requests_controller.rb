class CoworkerRequestsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /coworker_requests
  # GET /coworker_requests.json
  def index
    @coworker_requests = current_user.coworker_requests
    @coworker_request = CoworkerRequest.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @coworker_requests }
    end
  end

  # GET /coworker_requests/1
  # GET /coworker_requests/1.json
  def show
    @coworker_request = CoworkerRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @coworker_request }
    end
  end

  # GET /coworker_requests/new
  # GET /coworker_requests/new.json
  def new
    @coworker_request = CoworkerRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @coworker_request }
    end
  end

  # GET /coworker_requests/1/edit
  def edit
    @coworker_request = CoworkerRequest.find(params[:id])
  end

  # POST /coworker_requests
  # POST /coworker_requests.json
  def create
    @coworker_request = current_user.coworker_requests.new(params[:coworker_request])

    respond_to do |format|
        @coworker_request.save
        format.js
    end
  end

  # PUT /coworker_requests/1
  # PUT /coworker_requests/1.json
  def update
    @coworker_request = CoworkerRequest.find(params[:id])

    respond_to do |format|
      if @coworker_request.update_attributes(params[:coworker_request])
        format.html { redirect_to @coworker_request, notice: 'Coworker request was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @coworker_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coworker_requests/1
  # DELETE /coworker_requests/1.json
  def destroy
    @coworker_request = CoworkerRequest.find(params[:id])
    @coworker_request.destroy

    respond_to do |format|
      format.html { redirect_to coworker_requests_url }
      format.json { head :ok }
      format.js
    end
  end
end
