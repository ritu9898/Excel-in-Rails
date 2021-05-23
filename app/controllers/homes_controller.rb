class HomesController < ApplicationController
  
  def index
    @hospital_data = HospitalDatum.all
  end

  def new
    @hospital_data = HospitalDatum.new
  end

  def create
    @hospital_data = HospitalDatum.new(params_data)

    if @hospital_data.save
      redirect_to root_path
    else
      render :new
    end
  end

  def bulk_add_data
    file = params[:xml_file]
    xlsx = Roo::Spreadsheet.open(file, extension: :xlsx)
    count = xlsx.count
    for i in 1...count do
      hospital_name = xlsx.row(i+1)[0]
      oxygen_can = xlsx.row(i+1)[1]
      bed = xlsx.row(i+1)[2]

      @hospital_data = HospitalDatum.new(name: hospital_name, oxygen_can: oxygen_can, bed: bed)
      @hospital_data.save
    end
    redirect_to root_path
  end

  private

  def params_data 
    params.require(:hospital_datum).permit(:name, :oxygen_can, :bed)
    # params.permit(:name, :oxygen_can, :bed)

  end

end
