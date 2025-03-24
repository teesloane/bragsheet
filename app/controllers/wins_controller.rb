class WinsController < ApplicationController
  before_action :set_win, only: %i[ show edit update destroy ]
  before_action :require_authentication

  # GET /wins or /wins.json
  def index
    @wins = Win.all
  end

  # GET /wins/1 or /wins/1.json
  def show
  end

  # GET /wins/new
  def new
    @win = Win.new
  end

  # GET /wins/1/edit
  def edit
  end

  # POST /wins or /wins.json
  def create
    @win = Win.new(win_params)

    respond_to do |format|
      if @win.save
        format.html { redirect_to @win, notice: "Win was successfully created." }
        format.json { render :show, status: :created, location: @win }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @win.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wins/1 or /wins/1.json
  def update
    respond_to do |format|
      if @win.update(win_params)
        format.html { redirect_to @win, notice: "Win was successfully updated." }
        format.json { render :show, status: :ok, location: @win }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @win.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wins/1 or /wins/1.json
  def destroy
    @win.destroy!

    respond_to do |format|
      format.html { redirect_to wins_path, status: :see_other, notice: "Win was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_win
      @win = Win.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def win_params
      params.expect(win: [ :title, :description, :impact, :achievement_date, :private_notes, :user_id ])
    end
end
