using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace backOfficeApp.Migrations
{
    public partial class _3 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Bill_DeliveryBranch_DeliveryBranchId",
                table: "Bill");

            migrationBuilder.DropForeignKey(
                name: "FK_BranchTelNumber_DeliveryBranch_DeliveryBranchId",
                table: "BranchTelNumber");

            migrationBuilder.DropColumn(
                name: "BranchName",
                table: "DeliveryBranch");

            migrationBuilder.RenameColumn(
                name: "DeliveryBranchId",
                table: "BranchTelNumber",
                newName: "BranchId");

            migrationBuilder.RenameIndex(
                name: "IX_BranchTelNumber_DeliveryBranchId",
                table: "BranchTelNumber",
                newName: "IX_BranchTelNumber_BranchId");

            migrationBuilder.RenameColumn(
                name: "DeliveryBranchId",
                table: "Bill",
                newName: "DeliveryServiceId");

            migrationBuilder.RenameIndex(
                name: "IX_Bill_DeliveryBranchId",
                table: "Bill",
                newName: "IX_Bill_DeliveryServiceId");

            migrationBuilder.AddColumn<int>(
                name: "BranchId",
                table: "DeliveryBranch",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "BranchId",
                table: "Bill",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Branch",
                columns: table => new
                {
                    BranchId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    BranchName = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Branch", x => x.BranchId);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_DeliveryBranch_BranchId",
                table: "DeliveryBranch",
                column: "BranchId");

            migrationBuilder.CreateIndex(
                name: "IX_Bill_BranchId",
                table: "Bill",
                column: "BranchId");

            migrationBuilder.AddForeignKey(
                name: "FK_Bill_Branch_BranchId",
                table: "Bill",
                column: "BranchId",
                principalTable: "Branch",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Bill_DeliveryService_DeliveryServiceId",
                table: "Bill",
                column: "DeliveryServiceId",
                principalTable: "DeliveryService",
                principalColumn: "DeliveryServiceId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BranchTelNumber_Branch_BranchId",
                table: "BranchTelNumber",
                column: "BranchId",
                principalTable: "Branch",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_DeliveryBranch_Branch_BranchId",
                table: "DeliveryBranch",
                column: "BranchId",
                principalTable: "Branch",
                principalColumn: "BranchId",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Bill_Branch_BranchId",
                table: "Bill");

            migrationBuilder.DropForeignKey(
                name: "FK_Bill_DeliveryService_DeliveryServiceId",
                table: "Bill");

            migrationBuilder.DropForeignKey(
                name: "FK_BranchTelNumber_Branch_BranchId",
                table: "BranchTelNumber");

            migrationBuilder.DropForeignKey(
                name: "FK_DeliveryBranch_Branch_BranchId",
                table: "DeliveryBranch");

            migrationBuilder.DropTable(
                name: "Branch");

            migrationBuilder.DropIndex(
                name: "IX_DeliveryBranch_BranchId",
                table: "DeliveryBranch");

            migrationBuilder.DropIndex(
                name: "IX_Bill_BranchId",
                table: "Bill");

            migrationBuilder.DropColumn(
                name: "BranchId",
                table: "DeliveryBranch");

            migrationBuilder.DropColumn(
                name: "BranchId",
                table: "Bill");

            migrationBuilder.RenameColumn(
                name: "BranchId",
                table: "BranchTelNumber",
                newName: "DeliveryBranchId");

            migrationBuilder.RenameIndex(
                name: "IX_BranchTelNumber_BranchId",
                table: "BranchTelNumber",
                newName: "IX_BranchTelNumber_DeliveryBranchId");

            migrationBuilder.RenameColumn(
                name: "DeliveryServiceId",
                table: "Bill",
                newName: "DeliveryBranchId");

            migrationBuilder.RenameIndex(
                name: "IX_Bill_DeliveryServiceId",
                table: "Bill",
                newName: "IX_Bill_DeliveryBranchId");

            migrationBuilder.AddColumn<string>(
                name: "BranchName",
                table: "DeliveryBranch",
                type: "longtext",
                nullable: true)
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.AddForeignKey(
                name: "FK_Bill_DeliveryBranch_DeliveryBranchId",
                table: "Bill",
                column: "DeliveryBranchId",
                principalTable: "DeliveryBranch",
                principalColumn: "DeliveryBranchId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_BranchTelNumber_DeliveryBranch_DeliveryBranchId",
                table: "BranchTelNumber",
                column: "DeliveryBranchId",
                principalTable: "DeliveryBranch",
                principalColumn: "DeliveryBranchId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
