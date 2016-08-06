module RouteConstraint
  class Subdomain
    def matches?(request)
      matches_domain(request)
    end

    private

    def matches_domain(request)
      return true if request.env[:company_subdomain]
      company = Company.find_by_domain(request.subdomain)

      return false unless company

      request.env[:company_subdomain] = company.domain
      true
    end
  end
end
