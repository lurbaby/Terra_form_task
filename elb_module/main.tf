resource "aws_lb" "testalb" {
    name = "testalb"
    load_balancer_type = "application"
    security_groups = [var.security_group_id]
    subnets = [var.subnet_id, "subnet-0744dd61d658d36e6"]
}

resource "aws_lb_target_group" "my_tg" {
  name     = "my-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled = true
    path    = "/"
    protocol = "HTTP"
    interval = 30
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.testalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_tg.arn
  }
}
