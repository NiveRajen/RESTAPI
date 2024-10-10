# RESTAPI


 REST or RESTful API (Representational State Transfer) 
- An architectural style for designing networked applications.
- It emphasizes stateless communication, the use of standard HTTP methods (GET, POST, PUT, DELETE), and resources identified by URLs.Each request from a client contains all the information needed for the server to process it; no session state is stored on the server.
- RESTful APIs follow the constraints and principles of REST architecture, which emphasize statelessness, resource-based URLs, and the use of standard HTTP methods.


In essence, RESTful APIs emphasize a consistent, resource-oriented approach using standard HTTP methods, while RESTless APIs may take a more ad-hoc, action-oriented approach that can lead to inconsistency and reduced clarity. For developers, RESTful APIs generally provide a more predictable and easier-to-understand interface for integration and use.


Protocol: Primarily uses HTTP/HTTPS as its communication protocol.
Data Formats: Supports multiple formats such as JSON, XML, HTML, and plain text, with JSON being the most common.


Best Practices:
Always use HTTPS for all API endpoints.
Obtain a valid SSL/TLS certificate from a trusted certificate authority.
Implement HSTS (HTTP Strict Transport Security) to enforce secure connections.

Authentication:
OAuth: A widely used authorization framework that allows third-party applications to access user data without exposing credentials.
Use OAuth 2.0 for secure token-based authentication.



Implement rate limiting and input size restrictions to mitigate DoS (Denial of Service) attacks.
