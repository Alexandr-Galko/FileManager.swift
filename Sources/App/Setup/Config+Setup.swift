import LeafProvider // added

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)

        try setupProviders()
        try setupPreparations()
    }
    
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(LeafProvider.Provider.self)
    }
    
    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
    }
}
