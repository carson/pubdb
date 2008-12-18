class InbooksController < ApplicationController
  # GET /inbooks
  # GET /inbooks.xml
  def index
    @inbooks = Inbook.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inbooks }
    end
  end

  # GET /inbooks/1
  # GET /inbooks/1.xml
  def show
    @inbook = Inbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inbook }
    end
  end

  # GET /inbooks/new
  # GET /inbooks/new.xml
  def new
    @inbook = Inbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inbook }
    end
  end

  # GET /inbooks/1/edit
  def edit
    @inbook = Inbook.find(params[:id])
  end

  # POST /inbooks
  # POST /inbooks.xml
  def create
    @inbook = Inbook.new(params[:inbook])

    respond_to do |format|
      if @inbook.save
        flash[:notice] = 'Inbook was successfully created.'
        format.html { redirect_to(@inbook) }
        format.xml  { render :xml => @inbook, :status => :created, :location => @inbook }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inbooks/1
  # PUT /inbooks/1.xml
  def update
    @inbook = Inbook.find(params[:id])

    respond_to do |format|
      if @inbook.update_attributes(params[:inbook])
        flash[:notice] = 'Inbook was successfully updated.'
        format.html { redirect_to(@inbook) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inbooks/1
  # DELETE /inbooks/1.xml
  def destroy
    @inbook = Inbook.find(params[:id])
    @inbook.destroy

    respond_to do |format|
      format.html { redirect_to(inbooks_url) }
      format.xml  { head :ok }
    end
  end
end
