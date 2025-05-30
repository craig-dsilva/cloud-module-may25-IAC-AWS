resource "aws_cloudwatch_dashboard" "hotel-server" {
  dashboard_name = "hotel-server"
  dashboard_body = jsonencode({
    widgets = [
      {
        height = 6
        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              "i-0473bf1fdefa4d656",
              {
                region = "eu-west-1"
              },
            ],
          ]
          period               = 300
          region               = "eu-west-1"
          setPeriodToTimeRange = false
          sparkline            = true
          stacked              = false
          stat                 = "Average"
          title                = "EC2 Instance CPU"
          view                 = "gauge"
          yAxis = {
            left = {
              max = 100
              min = 0
            }
          }
        }
        type  = "metric"
        width = 12
        x     = 0
        y     = 0
      },
      {
        height = 6
        properties = {
          metrics = [
            [
              "AWS/RDS",
              "CPUUtilization",
              "DBInstanceIdentifier",
              "hotel-database",
              {
                region = "eu-west-1"
              },
            ],
          ]
          period  = 300
          region  = "eu-west-1"
          stacked = false
          stat    = "Average"
          title   = "RDS Instance CPU"
          view    = "gauge"
          yAxis = {
            left = {
              max = 100
              min = 0
            }
          }
        }
        type  = "metric"
        width = 12
        x     = 12
        y     = 0
      },
      {
        height = 6
        properties = {
          legend = {
            position = "bottom"
          }
          metrics = [
            [
              "AWS/RDS",
              "ReadLatency",
              "DBInstanceIdentifier",
              "hotel-database",
              {
                period = 60
              },
            ],
          ]
          period               = 60
          region               = "eu-west-1"
          setPeriodToTimeRange = true
          stacked              = false
          stat                 = "Average"
          view                 = "timeSeries"
        }
        type  = "metric"
        width = 6
        x     = 12
        y     = 6
      },
      {
        height = 6
        properties = {
          metrics = [
            [
              "AWS/RDS",
              "WriteLatency",
              "DBInstanceIdentifier",
              "hotel-database",
              {
                period = 60
              },
            ],
          ]
          region  = "eu-west-1"
          stacked = false
          view    = "timeSeries"
        }
        type  = "metric"
        width = 6
        x     = 18
        y     = 6
      },
      {
        height = 6
        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkIn",
              "InstanceId",
              "i-0473bf1fdefa4d656",
            ],
          ]
          region  = "eu-west-1"
          stacked = false
          view    = "timeSeries"
        }
        type  = "metric"
        width = 6
        x     = 0
        y     = 6
      },
      {
        height = 6
        properties = {
          metrics = [
            [
              "AWS/EC2",
              "NetworkOut",
              "InstanceId",
              "i-0473bf1fdefa4d656",
            ],
          ]
          region  = "eu-west-1"
          stacked = false
          view    = "timeSeries"
        }
        type  = "metric"
        width = 6
        x     = 6
        y     = 6
      },
    ]
    }
  )
}