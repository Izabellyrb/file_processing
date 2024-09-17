class FileProcessesController < ApplicationController
  before_action :xml_file, :check_file, only: [:import_file]
  before_action :authenticate_user!, only: %i[new index show]

  def index
    @invoices = Invoice.order(created_at: :desc).page(params[:page])

    index_filters
  end

  def new; end

  def import_file
    FileProcessorJob.perform_async(xml_file.read)
    flash[:notice] = "Arquivo enviado para processamento."

    redirect_to new_file_process_path
  end

  def show
    @invoice = Invoice.find(params[:id])
    @products = @invoice.products
  end

  private

  def xml_file
    params[:xml_file]
  end

  def check_file
    return if xml_file.present? && xml_file.content_type == "text/xml"

    flash[:alert] = "Por favor, insira um arquivo no formato xml."

    redirect_to new_file_process_path
  end

  def index_filters
    @invoices = @invoices.search_by_invoice_number(params[:invoice_number]) if params[:invoice_number].present?
    @invoices = @invoices.search_by_status(params[:status]) if params[:status].present?
    if params[:start_date].present? && params[:end_date].present?
      @invoices = @invoices.search_by_created_at(params[:start_date], params[:end_date])
    end
  end
end
