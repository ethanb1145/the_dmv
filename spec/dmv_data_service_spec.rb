require 'spec_helper'

RSpec.describe DmvDataService do
  before(:each) do
    @dds = DmvDataService.new
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@dds).to be_an_instance_of(DmvDataService)
    end
  end

  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://data.colorado.gov/resource/dsw3-mrn4.json'
      data_response = @dds.load_data(source)
      expect(data_response).to be_an_instance_of(Array)
      expect(data_response.size).to be_an(Integer)
    end
  end

  describe '#wa_ev_registrations' do
    it 'can load washington ev registration data' do
      expect(@dds.wa_ev_registrations.size).to be_an(Integer)
    end
  end

  describe '#co_dmv_office_locations' do
    it 'can load colorado dmv office locations' do
      co_dmv_office_locations = @dds.co_dmv_office_locations
      expect(@dds.co_dmv_office_locations.size).to be_an(Integer)

      colorado = co_dmv_office_locations.first
      expect(colorado).to include(
        :the_geom, :dmv_id, :dmv_office, :address_li, :address__1, :city,
        :state, :zip, :phone, :hours, :services_p, :photo, :address_id
      )
      [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
      :dmv_id=>"1",
      :dmv_office=>"DMV Tremont Branch",
      :address_li=>"2855 Tremont Place",
      :address__1=>"Suite 118",
      :city=>"Denver",
      :state=>"CO",
      :zip=>"80205",
      :phone=>"(720) 865-4600",
      :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
      :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
      :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
      :photo=>"images/Tremont.jpg",
      :address_id=>"175164",
      :@computed_region_nku6_53ud=>"1444"}]

      facilities = DmvDataService.new
    end
  end

  describe '#ny_dmv_office_locations' do
    it 'can load new york dmv office locations' do
      ny_dmv_office_locations = @dds.ny_dmv_office_locations
      expect(@dds.ny_dmv_office_locations.size).to be_an(Integer)
    end
  end

  describe '#mo_dmv_office_locations' do
    it 'can load missouri dmv office locations' do
      expect(@dds.mo_dmv_office_locations.size).to be_an(Integer)
    end
  end
end
