# SmartScoreCounter

SmartScoreCounter helps students at SFedU optimize their physical education attendance strategy to reach target points (60-100) using minimal attendances. Calculates optimal term 1 vs term 2 based on selected weekdays.​
## 🎯 Features

 Weekday Calendar Selection - Choose Mon/Wed/Fri etc. via highlighted month_calendar

 Dynamic Points Strategy - Real-time computation of minimal attendances to hit target range

 Points Tracker - +3/+4/-3 buttons with 0-100 bounds and live updates

 Sliders - Set semester_goal_lessons (Term1 attends) and target_points

 User Dashboard - Personalized schedule, current points, and optimal strategy display

# 🚀 Quick Start

```bash
# Clone & Install
git clone https://github.com/FuuzyTron/SmartScoreCounter.git
cd SmartScoreCounter
bundle install
bin/rails db:migrate
bin/rails db:seed  # Creates test users

# Start with asset watching (Tailwind)
./bin/dev
