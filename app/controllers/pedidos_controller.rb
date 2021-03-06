class PedidosController < ApplicationController
  before_action :set_pedido, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = Pedido.order(:id)
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    item = Iten.find(params[:pedido][:iten_id])
    respond_to do |format|
      if item.quantidade >= @pedido.quantidade
	  item.quantidade = item.quantidade - @pedido.quantidade

      if @pedido.save && item.save
          format.html { redirect_to @pedido, notice: 'Pedido was successfully created.' }
          format.json { render :show, status: :created, location: @pedido }
      else
          format.html { render :new }
          format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
      else
	  @pedido.errors.add(:quantidade,"Quantidade do pedido maior que no estoque")
	  format.html { render :new }
	  format.json { render json: @pedido.erros, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    item = Iten.find(@pedido.iten_id)
    qtdatual = @pedido.quantidade
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
      if qtdatual > @pedido.quantidade
         qtd = qtdatual - @pedido.quantidade
         item.quantidade = item.quantidade + qtd
      else 
          if qtdatual < @pedido.quantidade
              qtd = @pedido.quantidade - qtdatual
              item.quantidade = item.quantidade - qtd
          end
      end
     item.save
    end 
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    item = Iten.find(@pedido.iten_id)
    item.quantidade = item.quantidade + @pedido.quantidade
    item.save
    @pedido.destroy 
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:iten_id, :cliente_id, :quantidade, :valortotal, :datapedido)
    end
end
