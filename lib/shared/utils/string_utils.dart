class StringUtils {
  static String getInitials(String? name) {
    if (name == null) return "?";

    // Trim spaces
    String cleaned = name.trim();

    if (cleaned.isEmpty) return "?";

    // Split into words by spaces
    List<String> parts =
        cleaned.split(RegExp(r"\s+")).where((p) => p.isNotEmpty).toList();

    if (parts.isEmpty) return "?";

    // Case 1: Multiple words → first + last initial
    if (parts.length >= 2) {
      return (parts.first[0] + parts.last[0]).toUpperCase();
    }

    // Case 2: Single word
    String word = parts.first;

    // If word has multiple letters → first 2 letters
    if (word.length >= 2) {
      return (word[0] + word[1]).toUpperCase();
    }

    // Case 3: Single character (e.g., "A")
    if (word.isNotEmpty) {
      return word[0].toUpperCase();
    }

    // Fallback
    return "";
  }
}
