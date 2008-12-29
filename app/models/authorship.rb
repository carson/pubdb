class Authorship < ActiveRecord::Base
	belongs_to :person
	belongs_to :article
	belongs_to :book
	belongs_to :conference
	belongs_to :inbook
	belongs_to :thesis
	belongs_to :misc
	belongs_to :techreport
end
