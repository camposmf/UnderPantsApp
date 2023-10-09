using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UnderPantsApp.Migrations
{
    /// <inheritdoc />
    public partial class InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Login = table.Column<string>(type: "TEXT", maxLength: 30, nullable: false),
                    Password = table.Column<string>(type: "TEXT", maxLength: 20, nullable: false),
                    Name = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false),
                    Email = table.Column<string>(type: "TEXT", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "FinancialHistories",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    UserId = table.Column<int>(type: "INTEGER", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FinancialHistories", x => x.Id);
                    table.ForeignKey(
                        name: "FK_FinancialHistories_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Accounts",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    Amount = table.Column<double>(type: "REAL", nullable: false),
                    Date = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Accounts", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Accounts_FinancialHistories_HistoryId",
                        column: x => x.HistoryId,
                        principalTable: "FinancialHistories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Expenses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    Amount = table.Column<double>(type: "REAL", nullable: false),
                    Date = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Expenses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Expenses_FinancialHistories_HistoryId",
                        column: x => x.HistoryId,
                        principalTable: "FinancialHistories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Incomes",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    Amount = table.Column<double>(type: "REAL", nullable: false),
                    Date = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Incomes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Incomes_FinancialHistories_HistoryId",
                        column: x => x.HistoryId,
                        principalTable: "FinancialHistories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "RecurringExpenses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    Amount = table.Column<double>(type: "REAL", nullable: false),
                    RecurrenceFrequency = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RecurringExpenses", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RecurringExpenses_FinancialHistories_HistoryId",
                        column: x => x.HistoryId,
                        principalTable: "FinancialHistories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "SavingsGoals",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
                    GoalAmount = table.Column<double>(type: "REAL", nullable: false),
                    CompletionDate = table.Column<DateTime>(type: "TEXT", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SavingsGoals", x => x.Id);
                    table.ForeignKey(
                        name: "FK_SavingsGoals_FinancialHistories_HistoryId",
                        column: x => x.HistoryId,
                        principalTable: "FinancialHistories",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Accounts_HistoryId",
                table: "Accounts",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_HistoryId",
                table: "Expenses",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_FinancialHistories_UserId",
                table: "FinancialHistories",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Incomes_HistoryId",
                table: "Incomes",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_RecurringExpenses_HistoryId",
                table: "RecurringExpenses",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_SavingsGoals_HistoryId",
                table: "SavingsGoals",
                column: "HistoryId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Accounts");

            migrationBuilder.DropTable(
                name: "Expenses");

            migrationBuilder.DropTable(
                name: "Incomes");

            migrationBuilder.DropTable(
                name: "RecurringExpenses");

            migrationBuilder.DropTable(
                name: "SavingsGoals");

            migrationBuilder.DropTable(
                name: "FinancialHistories");

            migrationBuilder.DropTable(
                name: "Users");
        }
    }
}