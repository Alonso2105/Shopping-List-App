class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

# GET /products or /products.json
def index
  # Obtener solo los productos que tienen purchased como false y ordenar por fecha de compra
  products = Product.where(purchased: false).order(:purchase_date)

  # Agrupar los productos por fecha de compra, formateando la fecha a solo fecha (sin hora)
  @grouped_products = products.group_by { |product| product.purchase_date.to_date }
end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def create
    # Inicializa un nuevo producto con los parámetros proporcionados
    @product = Product.new(product_params.except("store_section_name"))
    
    # Obtiene el nombre de la sección de la tienda ingresado por el usuario
    store_section_name = product_params[:store_section_name]
    
    # Busca o crea la sección de la tienda por el nombre proporcionado
    store_section = StoreSection.find_or_create_by(name: store_section_name)
    
    # Asigna el ID de la sección de la tienda al producto
    @product.store_section_id = store_section.id
    
    # Establece el valor de purchased como false
    @product.purchased = false
    
    respond_to do |format|
      if @product.save
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', partial: 'products/modal') }
        format.html { redirect_to products_path }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', partial: 'products/form', locals: { product: @product }) }
        format.html { render :new }
      end
    end
  end


  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.update(purchased: true)

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@product) }
      format.html { redirect_to products_path, notice: 'Product was successfully updated' }
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit(:name, :purchase_date, :store_name, :store_section_name, :purchased, :quantity)
    end
end
