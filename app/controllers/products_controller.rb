class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def buy
    @product = Product.find(params[:id])
    culqi = Culqi.default_client
    datos_venta = {
              codigo_comercio: ENV['CULQI_CODIGO_COMERCIO'],
              numero_pedido: (current_user.id).to_s << '_' << Time.now.getutc.to_s,
              moneda: 'PEN',
              monto: (@product.price * 100).floor,
              descripcion: @product.name,
              correo_electronico: current_user.email,
              cod_pais: 'PE',
              ciudad: 'Lima',
              direccion: 'Av Javier Prado 2320, San Borja',
              num_tel: '986976309',
              id_usuario_comercio: current_user.id,
              nombres: 'Augusto',
              apellidos: 'Samame'
              }

    @venta = culqi.crear_venta(datos_venta)
    @informacion_venta = @venta['informacion_venta']

  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
