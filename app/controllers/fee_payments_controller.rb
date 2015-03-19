class FeePaymentsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :set_fee_payment, only: [:show, :edit, :update, :destroy]

  # GET /fee_payments
  # GET /fee_payments.json
  def index
    @fee_payments = FeePayment.all
  end

  # GET /fee_payments/1
  # GET /fee_payments/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "recipt",   # Excluding ".pdf" extension.
                :show_as_html                   => params[:debug].present?      # allow debugging based on url param
               # :disposition                    => 'attachment',                 # default 'inline'
               # :template                       => 'things/show.pdf.erb',
               # :file                           => "#{Rails.root}/files/foo.erb"
               # :layout                         => 'pdf.html',                   # use 'pdf.html' for a pdf.html.erb file
               # :wkhtmltopdf                    => '/usr/local/bin/wkhtmltopdf', # path to binary
               # :orientation                    => 'Landscape',                  # default Portrait
               # :page_size                      => 'A4, Letter, ...',            # default A4
               # :page_height                    => NUMBER,
               # :page_width                     => NUMBER,
               # :save_to_file                   => Rails.root.join('pdfs', "#{filename}.pdf"),
               # :save_only                      => false,                        # depends on :save_to_file being set first
               # :proxy                          => 'TEXT',
               # :basic_auth                     => false                         # when true username & password are automatically sent from session
               # :username                       => 'TEXT',
               # :password                       => 'TEXT',
               # :title                          => 'Alternate Title',            # otherwise first page title is used
               # :cover                          => 'URL, Pathname, or raw HTML string',
               # :dpi                            => 'dpi',
               # :encoding                       => 'TEXT',
               # :user_style_sheet               => 'URL',
               # :cookie                         => ['_session_id SESSION_ID'], # could be an array or a single string in a 'name value' format
               # :post                           => ['query QUERY_PARAM'],      # could be an array or a single string in a 'name value' format
               # :redirect_delay                 => NUMBER,
               # :javascript_delay               => NUMBER,
               # :image_quality                  => NUMBER,
               # :no_pdf_compression             => true,
               # :zoom                           => FLOAT,
               # :page_offset                    => NUMBER,
               # :book                           => true,
               # :default_header                 => true,
               # :disable_javascript             => false,
               # :grayscale                      => true,
               # :lowquality                     => true,
               # :enable_plugins                 => true,
               # :disable_internal_links         => true,
               # :disable_external_links         => true,
               # :print_media_type               => true,
               # :disable_smart_shrinking        => true,
               # :use_xserver                    => true,
               # :no_background                  => true,
               # :viewport_size                  => 'TEXT',                    # available only with use_xserver or patched QT
               # :extra                          => '',                        # directly inserted into the command to wkhtmltopdf
               # :outline => {:outline           => true,
               #              :outline_depth     => LEVEL},
               # :margin => {:top                => SIZE,                     # default 10 (mm)
               #             :bottom             => SIZE,
               #             :left               => SIZE,
               #             :right              => SIZE},
               # :header => {:html => { :template => 'users/header.pdf.erb',  # use :template OR :url
               #                        :layout   => 'pdf_plain.html',        # optional, use 'pdf_plain.html' for a pdf_plain.html.erb file, defaults to main layout
               #                        :url      => 'www.example.com',
               #                        :locals   => { :foo => @bar }},
               #             :center             => 'TEXT',
               #             :font_name          => 'NAME',
               #             :font_size          => SIZE,
               #             :left               => 'TEXT',
               #             :right              => 'TEXT',
               #             :spacing            => REAL,
               #             :line               => true,
               #             :content            => 'HTML CONTENT ALREADY RENDERED'}, # optionally you can pass plain html already rendered (useful if using pdf_from_string)
               # :footer => {:html => { :template => 'shared/footer.pdf.erb', # use :template OR :url
               #                        :layout   => 'pdf_plain.html',        # optional, use 'pdf_plain.html' for a pdf_plain.html.erb file, defaults to main layout
               #                        :url      => 'www.example.com',
               #                        :locals   => { :foo => @bar }},
               #             :center             => 'TEXT',
               #             :font_name          => 'NAME',
               #             :font_size          => SIZE,
               #             :left               => 'TEXT',
               #             :right              => 'TEXT',
               #             :spacing            => REAL,
               #             :line               => true,
               #             :content            => 'HTML CONTENT ALREADY RENDERED'}, # optionally you can pass plain html already rendered (useful if using pdf_from_string)
               # :toc    => {:font_name          => "NAME",
               #             :depth              => LEVEL,
               #             :header_text        => "TEXT",
               #             :header_fs          => SIZE,
               #             :text_size_shrink   => 0.8,
               #             :l1_font_size       => SIZE,
               #             :l2_font_size       => SIZE,
               #             :l3_font_size       => SIZE,
               #             :l4_font_size       => SIZE,
               #             :l5_font_size       => SIZE,
               #             :l6_font_size       => SIZE,
               #             :l7_font_size       => SIZE,
               #             :level_indentation  => NUM,
               #             :l1_indentation     => NUM,
               #             :l2_indentation     => NUM,
               #             :l3_indentation     => NUM,
               #             :l4_indentation     => NUM,
               #             :l5_indentation     => NUM,
               #             :l6_indentation     => NUM,
               #             :l7_indentation     => NUM,
               #             :no_dots            => true,
               #             :disable_dotted_lines => true,
               #             :disable_links      => true,
               #             :disable_toc_links  => true,
               #             :disable_back_links => true,
               #             :xsl_style_sheet    => 'file.xsl'} # optional XSLT stylesheet to use for styling table of contents
      end
    end
  end

  # GET /fee_payments/new
  def new
    @fee_payment = FeePayment.new
  end

  # GET /fee_payments/1/edit
  def edit
  end

  # POST /fee_payments
  # POST /fee_payments.json
  def create
    @fee_payment = FeePayment.new(fee_payment_params)
    @fee_payment.user = current_user

    respond_to do |format|
      if @fee_payment.save
        format.html { redirect_to @fee_payment, notice: 'Fee payment was successfully created.' }
        format.json { render :show, status: :created, location: @fee_payment }
      else
        format.html { render :new }
        format.json { render json: @fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fee_payments/1
  # PATCH/PUT /fee_payments/1.json
  def update
    respond_to do |format|
      if @fee_payment.update(fee_payment_params)
        format.html { redirect_to @fee_payment, notice: 'Fee payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @fee_payment }
      else
        format.html { render :edit }
        format.json { render json: @fee_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fee_payments/1
  # DELETE /fee_payments/1.json
  def destroy
    @fee_payment.destroy
    respond_to do |format|
      format.html { redirect_to fee_payments_url, notice: 'Fee payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fee_payment
      @fee_payment = FeePayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fee_payment_params
      params.require(:fee_payment).permit(:course_id, :user_id, :student_id, :institute_id, :paid)
    end
end
