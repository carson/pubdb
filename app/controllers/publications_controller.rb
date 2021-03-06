class PublicationsController < ApplicationController
  layout "application"

  before_filter :login_required

#   before_filter :authenticated
#   def authenticated
#     if not logged_in?
#       redirect_to("/login")
#     end
#   end

  # GET /publications
  # GET /publications.xml
  def index
    @publications = Publication.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @publications }
    end
  end

  # GET /publications/1
  # GET /publications/1.xml
  def show
    @publication = Publication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  # GET /publications/new
  # GET /publications/new.xml
  def new
    @publication = Publication.new
    @publication.authorships.build
    @publication.publication_projects.build
    @publication.publication_files.build
    # Make conference proceedings default
    @publication.publication_type = 'Conference'
    @publication.build_conference

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @publication }
    end
  end

  # GET /publications/1/edit
  def edit
    @publication = Publication.find(params[:id])
  end

  # POST /publications
  # POST /publications.xml
  def create
    # Delete event_id from conference if the client sent a new event
    params[:conference][:event_id] = nil if !params[:event].nil?
    
    @publication = Publication.new(params[:publication])
    case params[:publication][:publication_type]
      when 'Article':     @publication.build_article(params[:article])
      when 'Book':        @publication.build_book(params[:book])
      when 'Conference':  @publication.build_conference(params[:conference])
      when 'Inbook':      @publication.build_inbook(params[:inbook])
      when 'Misc':        @publication.build_misc(params[:misc])
      when 'Techreport':  @publication.build_techreport(params[:techreport])
      when 'Thesis':      @publication.build_thesis(params[:thesis])
    end
    # Create a new event if the client sent one
    @publication.conference.create_event(params[:event]) if !params[:event].nil?

    respond_to do |format|
      if @publication.save
        flash[:notice] = 'Publication was successfully created.'
        format.html { redirect_to(@publication) }
        format.xml  { render :xml => @publication, :status => :created, :location => @publication }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /publications/1
  # PUT /publications/1.xml
  def update
    params[:publication][:existing_authorship_attributes] ||= {}
    params[:publication][:existing_publication_project_attributes] ||= {}
    params[:publication][:existing_publication_file_attributes] ||= {}
    # Delete event_id from conference if the client sent a new event
    params[:conference][:event_id] = nil if !params[:event].nil?
    
    @publication = Publication.find(params[:id])
    
    if @publication.publication_type != params[:publication][:publication_type]
      # Destroy old
      @publication.article.destroy    if !@publication.article.nil?
      @publication.book.destroy       if !@publication.book.nil?
      @publication.conference.destroy if !@publication.conference.nil?
      @publication.inbook.destroy     if !@publication.inbook.nil?
      @publication.misc.destroy       if !@publication.misc.nil?
      @publication.techreport.destroy if !@publication.techreport.nil?
      @publication.thesis.destroy     if !@publication.thesis.nil?
      # Create new
      case params[:publication][:publication_type]
        when 'Article':     @publication.create_article(params[:article])
        when 'Book':        @publication.create_book(params[:book])
        when 'Conference':  @publication.create_conference(params[:conference])
        when 'Inbook':      @publication.create_inbook(params[:inbook])
        when 'Misc':        @publication.create_misc(params[:misc])
        when 'Techreport':  @publication.create_techreport(params[:techreport])
        when 'Thesis':      @publication.create_thesis(params[:thesis])
      end
    else
      # Update attributes
      case params[:publication][:publication_type]
        when 'Article':     @publication.article.attributes = params[:article]
        when 'Book':        @publication.book.attributes = params[:book]
        when 'Conference':  @publication.conference.attributes = params[:conference]
        when 'Inbook':      @publication.inbook.attributes = params[:inbook]
        when 'Misc':        @publication.misc.attributes = params[:misc]
        when 'Techreport':  @publication.techreport.attributes = params[:techreport]
        when 'Thesis':      @publication.thesis.attributes = params[:thesis]
      end
    end
    # Create a new event if the client sent one
    @publication.conference.create_event(params[:event]) if !params[:event].nil?

    respond_to do |format|
      if @publication.update_attributes(params[:publication])
        flash[:notice] = 'Publication was successfully updated.'
        format.html { redirect_to(@publication) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @publication.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.xml
  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy

    respond_to do |format|
      format.html { redirect_to(publications_url) }
      format.xml  { head :ok }
    end
  end
  
  # AJAX form switcher
  def switch_fields
    case params[:publication_type]
      when 'Article':     render :partial => 'article',     :object => Article.new
      when 'Book':        render :partial => 'book',        :object => Book.new
      when 'Conference':  render :partial => 'conference',  :object => Conference.new
      when 'Inbook':      render :partial => 'inbook',      :object => Inbook.new
      when 'Misc':        render :partial => 'misc',        :object => Misc.new
      when 'Techreport':  render :partial => 'techreport',  :object => Techreport.new
      when 'Thesis':      render :partial => 'thesis',      :object => Thesis.new
      else                render :nothing => true
    end
  end
  
end
