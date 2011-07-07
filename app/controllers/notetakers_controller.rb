class NotetakersController < ApplicationController

  
  # GET /notetakers
  # GET /notetakers.xml
  def index
    @notetakers = Notetaker.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notetakers }
    end
  end

  # GET /notetakers/1
  # GET /notetakers/1.xml
  def show
    @notetaker = Notetaker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @notetake }
    end
  end

  # GET /notetakers/new
  # GET /notetakers/new.xml
  def new
    @notetaker = Notetaker.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @notetaker }
    end
  end

  # GET /notetakers/1/edit
  def edit
    @notetaker = Notetaker.find(params[:id])
  end

  # POST /notetakers
  # POST /notetakers.xml
  def create
    @notetaker = Notetaker.new(params[:notetaker])

    respond_to do |format|
      if @notetaker.save
        format.html { redirect_to(@notetaker, :notice => 'Notetaker was successfully created.') }
        format.xml  { render :xml => @notetaker, :status => :created, :location => @notetaker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @notetaker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notetakers/1
  # PUT /notetakers/1.xml
  def update
    @notetaker = Notetaker.find(params[:id])

    respond_to do |format|
      if @notetaker.update_attributes(params[:notetaker])
        format.html { redirect_to(@notetaker, :notice => 'Notetaker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @notetaker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notetakers/1
  # DELETE /notetakers/1.xml
  def destroy
    @notetaker = Notetaker.find(params[:id])
    @notetaker.destroy

    respond_to do |format|
      format.html { redirect_to(notetakers_url) }
      format.xml  { head :ok }
    end
  end
end
