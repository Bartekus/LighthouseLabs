def experienced?(candidate)
  candidate[:years_of_experience] >= 2 ? true : false
end

def multilingual?(candidate)
  candidate[:languages].include?('Ruby' || 'Python') ? true : false
end

def github_master?(candidate)
  candidate[:github_points] > 100 ? true : false
end

def recent?(candidate)
  candidate[:date_applied] > 15.days.ago.to_date ? true : false
end

def mature?(candidate)
  candidate[:age] > 18 ? true : false
end

def find(id)
  @candidates.select { |candidate| return candidate if candidate[:id] == id }
end

def qualified_candidates(candidates)
  candidates.each { |candidate| experienced?(candidate) && github_master?(candidate) && multilingual?(candidate) && recent?(candidate) && mature?(candidate) }
end

def all
  @candidates.each { |candidate| candidate }
end

def order_by_qualifications(candidates)
  candidates.sort_by { |candidate| candidate[:years_of_experience] && candidate[:github_points] }
end
