import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("name") { req in
      return "Alex"
    } 
    }

}
