using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UnderPantsApp.Migrations
{
    /// <inheritdoc />
    public partial class CorrecaoTabelas : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Accounts_FinancialHistories_HistoryId",
                table: "Accounts");

            migrationBuilder.DropForeignKey(
                name: "FK_Expenses_FinancialHistories_HistoryId",
                table: "Expenses");

            migrationBuilder.DropForeignKey(
                name: "FK_Incomes_FinancialHistories_HistoryId",
                table: "Incomes");

            migrationBuilder.DropForeignKey(
                name: "FK_SavingsGoals_FinancialHistories_HistoryId",
                table: "SavingsGoals");

            migrationBuilder.DropTable(
                name: "RecurringExpenses");

            migrationBuilder.DropIndex(
                name: "IX_SavingsGoals_HistoryId",
                table: "SavingsGoals");

            migrationBuilder.DropIndex(
                name: "IX_Incomes_HistoryId",
                table: "Incomes");

            migrationBuilder.DropIndex(
                name: "IX_Expenses_HistoryId",
                table: "Expenses");

            migrationBuilder.DropIndex(
                name: "IX_Accounts_HistoryId",
                table: "Accounts");

            migrationBuilder.DropColumn(
                name: "Email",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "HistoryId",
                table: "SavingsGoals");

            migrationBuilder.DropColumn(
                name: "HistoryId",
                table: "Incomes");

            migrationBuilder.DropColumn(
                name: "HistoryId",
                table: "Expenses");

            migrationBuilder.DropColumn(
                name: "HistoryId",
                table: "Accounts");

            migrationBuilder.AddColumn<DateTime>(
                name: "BornDate",
                table: "Users",
                type: "TEXT",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<int>(
                name: "AccountId",
                table: "FinancialHistories",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "ExpenseId",
                table: "FinancialHistories",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "IncomeId",
                table: "FinancialHistories",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "SavingsGoalId",
                table: "FinancialHistories",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_FinancialHistories_AccountId",
                table: "FinancialHistories",
                column: "AccountId");

            migrationBuilder.CreateIndex(
                name: "IX_FinancialHistories_ExpenseId",
                table: "FinancialHistories",
                column: "ExpenseId");

            migrationBuilder.CreateIndex(
                name: "IX_FinancialHistories_IncomeId",
                table: "FinancialHistories",
                column: "IncomeId");

            migrationBuilder.CreateIndex(
                name: "IX_FinancialHistories_SavingsGoalId",
                table: "FinancialHistories",
                column: "SavingsGoalId");

            migrationBuilder.AddForeignKey(
                name: "FK_FinancialHistories_Accounts_AccountId",
                table: "FinancialHistories",
                column: "AccountId",
                principalTable: "Accounts",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FinancialHistories_Expenses_ExpenseId",
                table: "FinancialHistories",
                column: "ExpenseId",
                principalTable: "Expenses",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FinancialHistories_Incomes_IncomeId",
                table: "FinancialHistories",
                column: "IncomeId",
                principalTable: "Incomes",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_FinancialHistories_SavingsGoals_SavingsGoalId",
                table: "FinancialHistories",
                column: "SavingsGoalId",
                principalTable: "SavingsGoals",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_FinancialHistories_Accounts_AccountId",
                table: "FinancialHistories");

            migrationBuilder.DropForeignKey(
                name: "FK_FinancialHistories_Expenses_ExpenseId",
                table: "FinancialHistories");

            migrationBuilder.DropForeignKey(
                name: "FK_FinancialHistories_Incomes_IncomeId",
                table: "FinancialHistories");

            migrationBuilder.DropForeignKey(
                name: "FK_FinancialHistories_SavingsGoals_SavingsGoalId",
                table: "FinancialHistories");

            migrationBuilder.DropIndex(
                name: "IX_FinancialHistories_AccountId",
                table: "FinancialHistories");

            migrationBuilder.DropIndex(
                name: "IX_FinancialHistories_ExpenseId",
                table: "FinancialHistories");

            migrationBuilder.DropIndex(
                name: "IX_FinancialHistories_IncomeId",
                table: "FinancialHistories");

            migrationBuilder.DropIndex(
                name: "IX_FinancialHistories_SavingsGoalId",
                table: "FinancialHistories");

            migrationBuilder.DropColumn(
                name: "BornDate",
                table: "Users");

            migrationBuilder.DropColumn(
                name: "AccountId",
                table: "FinancialHistories");

            migrationBuilder.DropColumn(
                name: "ExpenseId",
                table: "FinancialHistories");

            migrationBuilder.DropColumn(
                name: "IncomeId",
                table: "FinancialHistories");

            migrationBuilder.DropColumn(
                name: "SavingsGoalId",
                table: "FinancialHistories");

            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Users",
                type: "TEXT",
                maxLength: 100,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<int>(
                name: "HistoryId",
                table: "SavingsGoals",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "HistoryId",
                table: "Incomes",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "HistoryId",
                table: "Expenses",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "HistoryId",
                table: "Accounts",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "RecurringExpenses",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    HistoryId = table.Column<int>(type: "INTEGER", nullable: false),
                    Amount = table.Column<double>(type: "REAL", nullable: false),
                    Description = table.Column<string>(type: "TEXT", maxLength: 255, nullable: false),
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

            migrationBuilder.CreateIndex(
                name: "IX_SavingsGoals_HistoryId",
                table: "SavingsGoals",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Incomes_HistoryId",
                table: "Incomes",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Expenses_HistoryId",
                table: "Expenses",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Accounts_HistoryId",
                table: "Accounts",
                column: "HistoryId");

            migrationBuilder.CreateIndex(
                name: "IX_RecurringExpenses_HistoryId",
                table: "RecurringExpenses",
                column: "HistoryId");

            migrationBuilder.AddForeignKey(
                name: "FK_Accounts_FinancialHistories_HistoryId",
                table: "Accounts",
                column: "HistoryId",
                principalTable: "FinancialHistories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Expenses_FinancialHistories_HistoryId",
                table: "Expenses",
                column: "HistoryId",
                principalTable: "FinancialHistories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Incomes_FinancialHistories_HistoryId",
                table: "Incomes",
                column: "HistoryId",
                principalTable: "FinancialHistories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_SavingsGoals_FinancialHistories_HistoryId",
                table: "SavingsGoals",
                column: "HistoryId",
                principalTable: "FinancialHistories",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
