class PurchaseCancellationsController < ApplicationController
  def index
    @purchase_cancellations = PurchaseCancellation.where(status: 'open')
  end

  def approve
    purchase_cancellation = PurchaseCancellation.find(params[:id])
    purchase_cancellation.approve!(current_user)
    purchase_cancellation.save

    redirect_to purchase_cancellations_path,
                success: t('flash.purchase_cancellation.approved')
  end

  def reject
    purchase_cancellation = PurchaseCancellation.find(params[:id])
    purchase_cancellation.reject!(current_user)
    purchase_cancellation.save

    redirect_to purchase_cancellations_path,
                success: t('flash.purchase_cancellation.rejected')
  end
end
