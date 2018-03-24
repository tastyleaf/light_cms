class SpreadsheetsController < ApplicationController
  def idnex
    @spreadsheets = Spreadsheet.all
  end

  def new
    @spreadsheet = Spreadsheet.new
  end

  def show
    
  end

end
