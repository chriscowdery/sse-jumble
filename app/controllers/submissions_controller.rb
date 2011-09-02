class SubmissionsController < ApplicationController
  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.js  { render :json => @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js  { render :json => @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    @submission = Submission.new

    respond_to do |format|
      format.html # new.html.erb
      format.js  { render :json => @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new
    @submission.magic_string = params[:participants]

    if @submission.save
      # format.html { redirect_to(@submission, :notice => 'Submission was successfully created.') }
      # format.js  { render :json => @submission, :status => :created, :location => @submission }
      render :text => "Valid", :status => 200
    else
      # format.html { render :action => "new" }
      # format.js  { render :json => @submission.errors, :status => :unprocessable_entity }
      logger.debug "submission errors: #{@submission.errors}"
      render :text => "Invalid", :status => 500
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
        format.js  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js  { render :json => @submission.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
      format.js  { head :ok }
    end
  end
end
