class ListItemsController < ApplicationController
  # GET /list_items
  # GET /list_items.xml
  def index
    @list_items = ListItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_items }
    end
  end

  # GET /list_items/1
  # GET /list_items/1.xml
  def show
    @list_item = ListItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/new
  # GET /list_items/new.xml
  def new
    @list = ShoppingList.find(params[:shopping_list_id])
    @list_item = @list.list_items.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_item }
    end
  end

  # GET /list_items/1/edit
  def edit
    @list_item = ListItem.find(params[:id])
  end

  # POST /list_items
  # POST /list_items.xml
  def create
    @list_item = ListItem.new(params[:list_item])

    respond_to do |format|
      if @list_item.save
        format.html { redirect_to(@list_item.shopping_list, :notice => 'List item was successfully created.') }
        format.xml  { render :xml => @list_item, :status => :created, :location => @list_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_items/1
  # PUT /list_items/1.xml
  def update
    @list_item = ListItem.find(params[:id])

    respond_to do |format|
      if @list_item.update_attributes(params[:list_item])
        format.html { redirect_to(@list_item, :notice => 'List item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_items/1
  # DELETE /list_items/1.xml
  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy

    respond_to do |format|
      format.html { redirect_to(@list_item.shopping_list) }
      format.xml  { head :ok }
    end
  end
end
