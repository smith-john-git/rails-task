class Estate < ApplicationRecord
  paginates_per 10
  max_paginates_per 10
end
