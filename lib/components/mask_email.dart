String maskEmail(String email) {
  final parts = email.split('@');
  final name = parts[0];
  final domainParts = parts[1].split('.');
  final domainName = domainParts[0];
  final tld = domainParts.sublist(1).join('.');

  final visibleName = name.length > 2 ? name.substring(0, 2) : name[0];
  final maskedName = '*' * (name.length - visibleName.length);

  final visibleDomain = domainName[0];
  final maskedDomain = '*' * (domainName.length - 1);

  return '$visibleName$maskedName@$visibleDomain$maskedDomain.$tld';
}
