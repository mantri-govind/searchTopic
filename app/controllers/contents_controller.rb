class ContentsController < ApplicationController
  #before_action :set_content, only: [:show, :edit, :update, :destroy,:result]

  before_filter :authenticate_user!


  # GET /contents
  # GET /contents.json

  def index
  #  @contents = Content.all
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end
   
  def result
    @search = Content.search do
        fulltext params[:search]
    end
    @contents = @search.results
    render "index"
  end

  # GET /contents/1/edit
  def edit
  end


  def download_file
#    begin
      id = params[:id]
      content = Content.find(id)
      contents_path = content.attachment.path
      
      content.download = 1 + (content.download==nil ? 0 : content.download  )
      content.save
      send_file(contents_path, :x_sendfile => true ,:disposition => 'inline')
    # rescue
    #   flash[:error] = "File not found!"
    #   redirect_to :back
    # end
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(contents_params)
     if @content.save
       redirect_to contents_path
     else
        render "new"
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(contents_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_content
    #   @content = Content.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
     
    def contents_params
      params.require(:content).permit(:title,:description,:attachment,:user_id,:tags)
    end
end
