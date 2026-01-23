use std::fmt;
use std::fmt::{Debug, Formatter};

pub struct Clock {
    hours: i32,
    minutes: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let mut fixed_hours = hours;
        while fixed_hours < 0 {
            fixed_hours += 24;
        }

        let mut fixed_minutes = minutes;
        while fixed_minutes < 0 {
            // println!("fixed_minutes : {}", fixed_minutes);
            // fixed_hours -= 1;
            if fixed_hours > 0 {
                fixed_hours -= 1;
            } else {
                fixed_hours = 23
            }
            fixed_minutes += 60;
        }
        Clock {
            hours: fixed_hours % 24,
            minutes: fixed_minutes % 60,
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        let additional_hours = minutes / 60;
        let additional_minutes = minutes % 60;
        Self {
            hours: self.hours + additional_hours,
            minutes: self.minutes + additional_minutes,
        }
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hours, self.minutes)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Self) -> bool {
        self.hours == other.hours && self.minutes == other.minutes
    }
}

impl Debug for Clock {
    fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
        self.to_string().fmt(f)
    }
}
