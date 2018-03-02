import Vapor
// import Glibc
import Foundation

extension Droplet 
{
    func setupRoutes() throws 
    {
        get("name")
        { 
        	request in
      		return "Alex"
    	}
    	get("storage","*") 
    	{ request in
    		let fm = FileManager()
    		do 
    		{
                let path = request.uri.path
				var files = try fm.contentsOfDirectory(atPath:"./" + path)
				files.sort()
				// try files.copyItem(atPath:toPath:)
      		    return try self.view.make("files", ["files": files, "path": path])
			}
			catch
			{
              print("error files")
              throw Abort(.badRequest, reason: "Sorry 😱")
            }
        }
        
        get("error") 
        { request in
             throw Abort(.badRequest, reason: "Sorry 😱")
        }
        get("test","*") 
        { request in
            let path = request.uri.path
             return "path:" + path
        }

    	get("view") 
    	{ request in
      		return try self.view.make("view")
    	}    	
    }
}
