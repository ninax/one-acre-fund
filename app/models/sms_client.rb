class SmsClient < ActiveRecord::Base
  attr_accessible :ChangeFee, :ClientID, :ClientName, :ClientPhoneNumber, :CreditAdjustment, :DebtForgive, :Deceased, :DeferredCredit, :Delivery, :DistrictID, :DistrictName, :Dropped, :DroppedDate, :Enrollment, :EnrollmentDate, :FMID, :FOID, :Facilitator, :FieldManager, :FieldOfficer, :FirstSeason, :FuneralAsstFee, :GovDistrictID, :GovDistrictName, :GroupActive, :GroupFirstSeason, :GroupID, :GroupName, :InputCredit, :LandWaterHarvest, :LastRepayment, :NationalID, :NewClientFee, :PreviousDeferredCredit, :RepaymentTotal, :SeasonClientID, :SeasonDataEntryDate, :SeasonID, :SeasonName, :SectorID, :SectorName, :Service, :SiteActive, :SiteFirstSeason, :SiteID, :SiteName, :StockID, :TotalCredit, :TrainingFee, :district, :site, :group, :gRepaymentAmount, :lRepaymentAmount, :gRepaymentRate, :lRepaymentRate
  attr_accessor :district, :site, :group, :gRepaymentAmount, :lRepaymentAmount, :gRepaymentRate, :lRepaymentRate
  self.primary_key = "ClientID"

  def self.by_district(district)
    if district.present?
      array = district.split(',').map { |n| n.to_i }
      where(:DistrictID => array)
    else 
      where('1=1')
    end
  end
  
  def self.by_site(site)
    if site.present?
      array = site.split(',').map { |n| n.to_i }
      where(:SiteID => array)
    else 
      where('1=1')
    end
  end
  
  def self.by_group(group)
    if group.present?
      array = group.split(',').map { |n| n.to_i }
      where(:GroupID => array)
    else 
      where('1=1')
    end
  end
  
  def self.greaterthan_amount(amount)
    if amount.present?
      where("RepaymentTotal > ?", amount)
    else 
      where('1=1')
    end
  end
  
  def self.lessthan_amount(amount)
    if amount.present?
      where("RepaymentTotal < ?", amount)
    else 
      where('1=1')
    end
  end
  
  def self.greaterthan_rate(rate)
    if rate.present?
      where("RepaymentTotal/NullIF(TotalCredit,0) > ?", rate)
    else 
      where('1=1')
    end
  end
  
  def self.lessthan_rate(rate)
    if rate.present?
      where("RepaymentTotal/NullIF(TotalCredit,0) < ?", rate)
    else 
      where('1=1')
    end
  end
end
  