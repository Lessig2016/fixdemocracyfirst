class StatementsController < ApplicationController
  before_filter :require_admin, except: [:new, :create, :browse, :show]
  before_action :set_statement, only: [:show, :edit, :update, :destroy]

  # GET /statements
  # GET /statements.json
  def index
    @statements = Statement.all
  end

  def browse
    @videos = Statement.approved
  end

  # GET /statements/1
  # GET /statements/1.json
  def show
    redirect_to '/' unless @statement.approved or @current_user.admin?
  end

  # GET /statements/new
  def new
    @videos = Statement.approved
  end

  # GET /statements/1/edit
  def edit
  end

  # POST /statements
  # POST /statements.json
  def create
    @statement = Statement.new(statement_params)
    @statement.title = "New #{@statement.url.blank? ? 'Tip' : 'Video'} #{DateTime.now}"
    @statement.ugc_date = DateTime.strptime(statement_params[:ugc_date], '%m/%d/%Y').to_date unless statement_params[:ugc_date].nil? or statement_params[:ugc_date].empty?
    @statement.user_id = @current_user.id
    @current_user.update(statement_params['user_attributes'])
    respond_to do |format|
      if @statement.save!
        format.html { redirect_to '/', notice: 'Thank you for contributing to Fix Democracy First!' }
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { redirect_to '/', alert: 'Sorry, your contribution cannot be processed at this time. Please try again later.' }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statements/1
  # PATCH/PUT /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html { redirect_to @statement, notice: 'Statement was successfully updated.' }
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit }
        format.json { render json: @statement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.json
  def destroy
    @statement.destroy
    respond_to do |format|
      format.html { redirect_to statements_url, notice: 'Statement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_statement
      @statement = Statement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def statement_params
      params.require(:statement).permit(:rwu_id, 
                                        :user_id, 
                                        :event_day_id, 
                                        :campaign_id,
                                        :candidate_id, 
                                        :title, 
                                        :url, 
                                        :description, 
                                        :approved, 
                                        :ugc_candidate_name, 
                                        :ugc_date,
                                        :ugc_event_title, 
                                        :ugc_event_location, 
                                        :ugc_notes, 
                                        :youtube_url,
                                        :third_party_url,
                                        :tag_ids => [],
                                        user_attributes: [:first_name, :last_name, :email, :mobile_phone, :postal_code])
    end
end