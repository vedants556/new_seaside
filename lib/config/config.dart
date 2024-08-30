// lib/config/config.dart

class Config {
  // Base URL for the INCOIS API
  static const String baseUrl = 'https://incois.gov.in/api'; // Replace with the actual base URL if different

  // Specific endpoints for fetching beach data and suitability information
  static const String beachesEndpoint = '$baseUrl/beaches'; // Update with the correct endpoint for beach data
  static const String suitabilityEndpoint = '$baseUrl/suitability'; // Update with the correct endpoint for suitability data

  // Additional API endpoints for other parameters if needed
  static const String waterQualityEndpoint = '$baseUrl/water-quality'; // Replace with the correct endpoint
  static const String alertsEndpoint = '$baseUrl/alerts'; // Replace with the correct endpoint
  static const String weatherEndpoint = '$baseUrl/weather'; // Replace with the correct endpoint

  // API keys or tokens (if required)
  static const String apiKey = 'YOUR_API_KEY'; // Replace with your actual API key, if needed

  // Mock data configuration
  static const bool useMockData = true; // Add this line to enable mock data during testing
}
