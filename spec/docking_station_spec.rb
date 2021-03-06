require "docking_station"

describe DockingStation do

  subject(:docking_station) { DockingStation.new }

  it { is_expected.to respond_to('release_bike') }

  it 'releases working bike' do
     bike = Bike.new
     docking_station.dock(bike)
     expect(bike).to be_working
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
    expect { docking_station.release_bike }.to raise_error('No bikes!')
    end
  end

  describe '#dock' do

    it 'raises an error when full' do
      20.times { docking_station.dock Bike.new }
      expect { docking_station.dock Bike.new }.to raise_error 'Dock full!'
    end
  end
end
