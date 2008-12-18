class TechreportsController < ApplicationController
  # GET /techreports
  # GET /techreports.xml
  def index
    @techreports = Techreport.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @techreports }
    end
  end

  # GET /techreports/1
  # GET /techreports/1.xml
  def show
    @techreport = Techreport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @techreport }
    end
  end

  # GET /techreports/new
  # GET /techreports/new.xml
  def new
    @techreport = Techreport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @techreport }
    end
  end

  # GET /techreports/1/edit
  def edit
    @techreport = Techreport.find(params[:id])
  end

  # POST /techreports
  # POST /techreports.xml
  def create
    @techreport = Techreport.new(params[:techreport])

    respond_to do |format|
      if @techreport.save
        flash[:notice] = 'Techreport was successfully created.'
        format.html { redirect_to(@techreport) }
        format.xml  { render :xml => @techreport, :status => :created, :location => @techreport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @techreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /techreports/1
  # PUT /techreports/1.xml
  def update
    @techreport = Techreport.find(params[:id])

    respond_to do |format|
      if @techreport.update_attributes(params[:techreport])
        flash[:notice] = 'Techreport was successfully updated.'
        format.html { redirect_to(@techreport) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @techreport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /techreports/1
  # DELETE /techreports/1.xml
  def destroy
    @techreport = Techreport.find(params[:id])
    @techreport.destroy

    respond_to do |format|
      format.html { redirect_to(techreports_url) }
      format.xml  { head :ok }
    end
  end
end
