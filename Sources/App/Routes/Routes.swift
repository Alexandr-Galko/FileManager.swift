import Vapor
// import Glibc
import Foundation

extension Droplet 
{
    func setupRoutes() throws 
    {
        get("name")
        { 
        	req in
      		return "Alex"
    	}
    	get("files") 
    	{ req in
    		let fm = FileManager()
    		do 
    		{
				var files = try fm.contentsOfDirectory(atPath:"./")
				files.sort()
				// try files.copyItem(atPath:toPath:)
      		    return try self.view.make("files", ["files": files])
			}
			catch
			{
			  print("error files")
      		  return "error files"
			}
		}
    	
    	get("view") 
    	{ req in
      		return try self.view.make("view")
    	}    	
    }
}
