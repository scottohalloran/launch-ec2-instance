resource "aws_apigatewayv2_domain_name" "awsresumeapi-tf" {
  domain_name = "awsresumeapi-tf.scottohallorancv.com"

  domain_name_configuration {
    certificate_arn = aws_acm_certificate.awsresumeapi-tf.arn
    endpoint_type   = "REGIONAL"
    security_policy = "TLS_1_2"
  }

  depends_on = [aws_acm_certificate_validation.awsresumeapi-tf]
}

resource "aws_route53_record" "awsresumeapi-tf" {
  name    = aws_apigatewayv2_domain_name.awsresumeapi-tf.domain_name
  type    = "A"
  zone_id = data.aws_route53_zone.public.zone_id

  alias {
    name                   = aws_apigatewayv2_domain_name.awsresumeapi-tf.domain_name_configuration[0].target_domain_name
    zone_id                = aws_apigatewayv2_domain_name.awsresumeapi-tf.domain_name_configuration[0].hosted_zone_id
    evaluate_target_health = false
  }
}
