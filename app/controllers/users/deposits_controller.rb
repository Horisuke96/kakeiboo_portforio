class Users::DepositsController < ApplicationController

  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(params_deposit)
    @deposit.user_id = current_user.id
    if @deposit.save
      redirect_to deposit_path(@deposit)
    else
      render :new
    end
  end

  def show
    @deposit = Deposit.find(params[:id])
  end

  def daily
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # 取得した時刻が含まれる月の範囲のデータを取得
    @deposits = Deposit.where(date: @month.all_month)




  end

  def monthly
  end

  def edit
    @deposit = Deposit.find(params[:id])
    if @deposit.user == current_user
      render "edit"
    else
      redirect_to deposit_path(@deposit)
    end
  end

  def update
    @deposit = Deposit.find(params[:id])
    if @deposit.update(params_deposit)
      flash[:success] = "支出を変更しました"
      redirect_to deposit_path(@deposit)
    else
      render :edit
    end
  end

  def destroy
    @deposit = Deposit.find(params[:id])
    if @deposit.destroy
      flash[:alert] = "支出を削除しました"
      redirect_to deposit_path
    else
      @deposit = Deposit.all
      render :index
    end
  end


  private
  def params_deposit
    params.require(:deposit).permit(:date, :amount, :note, :image, :user_id)
  end
end
