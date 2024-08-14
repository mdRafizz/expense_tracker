import 'model/expense_category.dart';

List<ExpenseCategory> getCategories() {
  return [
    ExpenseCategory(
      name: 'Housing',
      subCategories: [
        SubCategory(
          name: 'Rent/Mortgage',
        ),
        SubCategory(
          name: 'Utilities',
          subCategories: [
            'Electricity',
            'Water & Sewage',
            'Gas/Heating',
            'Internet/Cable',
            'Trash Removal'
          ],
        ),
        SubCategory(
          name: 'Property Taxes',
        ),
        SubCategory(
          name: 'Home Insurance',
        ),
        SubCategory(
          name: 'Maintenance & Repairs',
          subCategories: [
            'Plumbing',
            'Electrical Work',
            'Painting & Renovation',
            'Gardening & Landscaping',
            'Appliance Repairs'
          ],
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Transportation',
      subCategories: [
        SubCategory(
          name: 'Public Transportation',
          subCategories: [
            'Bus/Train Passes',
            'Taxis/Ride sharing',
            'Carpooling'
          ],
        ),
        SubCategory(name: 'Fuel'),
        SubCategory(name: 'Car Payments'),
        SubCategory(
          name: 'Vehicle Maintenance',
          subCategories: [
            'Oil Changes',
            'Tire Replacements',
            'Brake Service',
            'Car Washes',
            'Vehicle Inspection'
          ],
        ),
        SubCategory(
          name: 'Insurance',
        ),
        SubCategory(
          name: 'Parking',
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Food & Groceries',
      subCategories: [
        SubCategory(
          name: 'Groceries',
          subCategories: [
            "Fresh Produce",
            "Meat & Seafood",
            "Dairy Products",
            "Pantry Staples",
            "Household Items",
          ],
        ),
        SubCategory(
          name: "Dining Out",
          subCategories: [
            "Fast Food",
            "Fine Dining",
            "Cafes & Coffee Shops",
          ],
        ),
        SubCategory(
          name: "Snacks & Beverages",
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Health Insurance',
      subCategories: [
        SubCategory(
          name: "Doctor Visits",
          subCategories: [
            "General Practitioner",
            "Specialists",
            "Routine Checkups",
          ],
        ),
        SubCategory(
          name: "Medications",
          subCategories: [
            "Prescription Medications",
            "Over-the-Counter Drugs",
            "Supplements & Vitamins",
          ],
        ),
        SubCategory(
          name: 'Dental & Vision Care',
        ),
        SubCategory(
          name: "Wellness",
          subCategories: [
            "Gym Memberships",
            "Yoga Classes",
            "Meditation Apps",
          ],
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Debt Payments',
      subCategories: [
        SubCategory(
          name: "Credit Card Payments",
          subCategories: [
            "Minimum Payments",
            "Interest Payments",
            "Late Fees",
          ],
        ),
        SubCategory(
          name: "Loan Payments",
          subCategories: [
            "Student Loans",
            "Auto Loans",
            "Mortgage Principal & Interest",
          ],
        ),
        SubCategory(
          name: 'Other Debts',
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Savings & Investments',
      subCategories: [
        SubCategory(
          name: "Emergency Fund",
          subCategories: [
            "Regular Deposits",
            "High-Interest Savings Account",
          ],
        ),
        SubCategory(
          name: "Retirement Savings",
          subCategories: [
            "401(k) Contributions",
            "IRA Contributions",
            "Employer Matching Contributions",
          ],
        ),
        SubCategory(
          name: "Other Investments",
          subCategories: [
            "Stocks & Bonds",
            "Real Estate Investments",
            "Cryptocurrency",
            "Mutual Funds",
          ],
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Entertainment & Recreation',
      subCategories: [
        SubCategory(
          name: 'Movies, Concerts, and Events',
        ),
        SubCategory(
          name: 'Hobbies',
        ),
        SubCategory(
          name: "Subscriptions",
          subCategories: [
            "Streaming Services",
            "Gaming Subscriptions",
            "Magazines/Newspapers",
          ],
        ),
        SubCategory(
          name: "Vacations & Travel",
          subCategories: [
            "Flights",
            "Accommodation",
            "Travel Insurance",
          ],
        ),
      ],
    ),
    ExpenseCategory(
      name: 'Personal Care',
      subCategories: [
        SubCategory(
          name: 'Clothing',
        ),
        SubCategory(
          name: "Haircuts & Grooming",
          subCategories: [
            "Haircuts & Styling",
            "Shaving Supplies",
            "Manicures/Pedicures",
          ],
        ),
        SubCategory(
          name: "Beauty Products",
          subCategories: [
            "Skincare Products",
            "Makeup",
            "Perfumes/Colognes",
          ],
        )
      ],
    ),
  ];
}
