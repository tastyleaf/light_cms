class SpreadsheetsController < ApplicationController
  def idnex
    @spreadsheets = Spreadsheet.all
  end

  def new
    @spreadsheet = Spreadsheet.new
  end

  def create
    @spreadsheet = Spreadsheet.new(spreadsheet_params)
    @spreadsheet.spreadsheet_id =  @spreadsheet.spreadsheet_id.split('/')[5]
    if @spreadsheet.save
      redirect_to tab_spreadsheet_path(@spreadsheet)
    else
      #add restriction for unvailid url 
      render :new
    end
  end

  def tab
    set_spreadsheet

    require 'google/apis/sheets_v4'
    service = Google::Apis::SheetsV4::SheetsService.new
    service.key = 'AIzaSyCw1eTY-S9Xuxqv4AZ_bfHDlxEJ3KsLuig'
    service.authorization = nil
    @reponses = service.get_spreadsheet(@spreadsheet.spreadsheet_id)
    @tabs = service.get_spreadsheet(@spreadsheet.spreadsheet_id, fields: "sheets.properties").sheets
    
  end


  def show
    
  end


  private

  def set_spreadsheet
    @spreadsheet = Spreadsheet.find(params[:id])    
  end

  def spreadsheet_params
    params.require(:spreadsheet).permit(:spreadsheet_id, :tab_id, :tab_name, :range, :link_name)
  end

end
