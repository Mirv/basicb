module CountriesHelper
    def whichPartial?(testPart)
        testPart ? 'test_partial' : 'country_neighbors'
    end
end
