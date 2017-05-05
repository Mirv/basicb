module CountriesHelper
    
    def whichPartial?(testPart)
        testPart == true ? 'test_partial' : 'country_neighbors'
    end
end
