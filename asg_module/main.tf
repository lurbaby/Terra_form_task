
resource "aws_launch_template" "lurbaby-template-asg"{
    name_prefix = "lrby-tmpl"
    image_id = var.ami
    instance_type = var.instance_type
}

resource "aws_autoscaling_group" "lurbaby-asg" {
    # availability_zones = ["eu-central-1c"]
    desired_capacity = 1
    max_size = 3
    min_size = 1
    vpc_zone_identifier = [var.subnet_id]
    health_check_type   = "EC2"

    launch_template {
        id = aws_launch_template.lurbaby-template-asg.id
        version = "$Latest" 
    }

}

resource "aws_autoscaling_schedule" "scale-time-up" {
    scheduled_action_name = "scale-time-up"

    desired_capacity = 2
    max_size = 3
    min_size = 1
    start_time = "2024-02-15T9:00:00Z"
    end_time = "2024-02-15T18:00:00Z"
    # або так або так
    recurrence = "0 6 * * *"
    autoscaling_group_name = aws_autoscaling_group.lurbaby-asg.name

}


resource "aws_autoscaling_schedule" "scale-time-down" {
    scheduled_action_name = "scale-time-down"

    desired_capacity = 1
    max_size = 3
    min_size = 1
    start_time = "2024-02-15T18:00:00Z"
    end_time = "2024-02-15T18:00:00Z"
    # або так або так
    recurrence = "0 18 * * *"
    autoscaling_group_name = aws_autoscaling_group.lurbaby-asg.name


}