class ComicsController < ApplicationController
  before_action :set_comic, only: %i[ show edit update destroy ]

  # GET /comics or /comics.json
  def index
    sortable = %w[title publisher purchase_date box]
    sort = params[:sort].presence_in(sortable) || 'title'
    direction = params[:direction] == 'desc' ? 'desc' : 'asc'

    order_clause = case sort
    when 'title'
      ["title #{direction}", "issue_number ASC"]
    when 'publisher', 'purchase_date', 'box'
      ["#{sort} #{direction}", "title ASC", "issue_number ASC"]
    else
      ["title ASC", "issue_number ASC"]
    end

    @comics = Comic.order(Arel.sql(order_clause.join(', ')))
  end

  # GET /comics/1 or /comics/1.json
  def show
  end

  # GET /comics/new
  def new
    @comic = Comic.new
  end

  # GET /comics/1/edit
  def edit
  end

  # POST /comics or /comics.json
  def create
    @comic = Comic.new(comic_params)

    respond_to do |format|
      if @comic.save
        format.html { redirect_to @comic, notice: "Comic was successfully created." }
        format.json { render :show, status: :created, location: @comic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comics/1 or /comics/1.json
  def update
    respond_to do |format|
      if @comic.update(comic_params)
        format.html { redirect_to @comic, notice: "Comic was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @comic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comics/1 or /comics/1.json
  def destroy
    @comic.destroy!

    respond_to do |format|
      format.html { redirect_to comics_path, notice: "Comic was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comic
      @comic = Comic.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def comic_params
      params.expect(comic: [ :title, :issue_number, :legacy_issue, :cover_variant, :publisher, :copies, :purchase_date, :cost, :box, :comments ])
    end
end
