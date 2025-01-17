// HOST URL
const hosturl = "https://odoo-combat-latest.onrender.com";
const endpoint = "/api/v1";
const String apiUrl = "$hosturl$endpoint";

Map<String, String> createAuthorizationHeaders(String? token,
    {bool contentType = false}) {
  if (contentType) {
    return {
      'Authorization': 'Bearer $token',
      "Content-Type": "application/json"
    };
  }
  return {"Authorization": 'Bearer $token'};
}