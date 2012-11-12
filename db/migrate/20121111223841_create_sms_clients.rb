class CreateSmsClients < ActiveRecord::Migration
  def change
    create_table :sms_clients do |t|
      t.string :ClientName
      t.string :NationalID
      t.string :SeasonName
      t.datetime :EnrollmentDate
      t.binary :Dropped
      t.datetime :DroppedDate
      t.binary :Facilitator
      t.timestamp :SeasonDataEntryDate
      t.integer :SeasonID
      t.binary :Deceased
      t.string :GroupName
      t.string :SiteName
      t.string :SectorName
      t.string :DistrictName
      t.string :GovDistrictName
      t.integer :ClientID
      t.integer :GroupID
      t.integer :SiteID
      t.integer :SectorID
      t.integer :DistrictID
      t.integer :GovDistrictID
      t.string :FieldOfficer
      t.string :FieldManager
      t.integer :FOID
      t.integer :FMID
      t.integer :GroupFirstSeason
      t.integer :SiteFirstSeason
      t.integer :StockID
      t.binary :LandWaterHarvest
      t.binary :GroupActive
      t.binary :SiteActive
      t.integer :FirstSeason
      t.float :TotalCredit
      t.float :RepaymentTotal
      t.float :Service
      t.float :Delivery
      t.float :DebtForgive
      t.float :InputCredit
      t.float :ChangeFee
      t.integer :Enrollment
      t.float :TrainingFee
      t.float :FuneralAsstFee
      t.float :NewClientFee
      t.float :DeferredCredit
      t.float :CreditAdjustment
      t.float :PreviousDeferredCredit
      t.integer :SeasonClientID
      t.datetime :LastRepayment
      t.string :ClientPhoneNumber

      t.timestamps
    end
  end
end
